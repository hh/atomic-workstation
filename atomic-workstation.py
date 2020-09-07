import abc
import json
import sys


class JsonRepr(abc.ABC):
    @abc.abstractmethod
    def to_json(self):
        pass


class JsonReprEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, JsonRepr):
            return obj.to_json()
        return super().default(obj)


class _TemplatePart(JsonRepr):
    def __init__(self, **args):
        self.args = args

    def to_json(self):
        return self.args

    def copy(self, **args):
        new_args = self.args.copy()
        new_args.update(args)
        return self.__class__(**new_args)


class _TemplateList(JsonRepr):
    def __init__(self, *elems):
        self.elems = [e for e in elems if e is not None]

    def to_json(self):
        return self.elems


class Template(_TemplatePart):
    def __init__(self, *, post_processors=None, **args):
        super().__init__(**args)
        if post_processors:
            self.args['post-processors'] = post_processors


class Builder(_TemplatePart): pass
class Provisioner(_TemplatePart): pass
class PostProcessor(_TemplatePart): pass
class Variables(_TemplatePart): pass
class Commands(_TemplateList): pass
class PostProcessorChain(_TemplateList): pass


def Optional(present, value):
    return value if present else None


class Environment(_TemplatePart):
    def to_json(self):
        return ['%s=%s' % (k, v) for k, v in self.args.items()]


common_builder = Builder(
    boot_command=[
        '<tab> '
        'linux text biosdevname=0 '
        'ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/{{ user `kickstart` }}'
        '<enter>'
        '<enter>',
    ],
    disk_size='{{ user `disk_size` }}',
    headless='{{ user `headless` }}',
    http_directory='http',

    iso_checksum='{{ user `iso_checksum` }}',
    iso_urls=[
        '{{ user `iso_url` }}',
    ],

    shutdown_command='{{ user `shutdown_command` }}',
    communicator='ssh',
    ssh_password='{{ user `ssh_password` }}',
    ssh_username='{{ user `ssh_username` }}',
    ssh_timeout='10000s',
)


shell_provisioner = Provisioner(
    type='shell',
    execute_command='echo vagrant | {{ .Vars }} sudo -E -S bash "{{ .Path }}"',
)


base_env = Environment(
    http_proxy='{{ user `http_proxy` }}',
    https_proxy='{{ user `https_proxy` }}',
    ftp_proxy='{{ user `ftp_proxy` }}',
    rsync_proxy='{{ user `rsync_proxy` }}',
    no_proxy='{{ user `no_proxy` }}',
)


atomic_workstation = Template(
    builders=[
        common_builder.copy(
            type='vmware-iso',
            guest_os_type='{{ user `vmware_guest_os_type` }}',
            vmx_data={
                'cpuid.coresPerSocket': '1',
                'memsize': '{{ user `memory` }}',
                'numvcpus': '{{ user `cpus` }}',
            },
        ),
        common_builder.copy(
            type='virtualbox-iso',
            guest_additions_mode='disable',
            guest_os_type='{{ user `virtualbox_guest_os_type` }}',
            vboxmanage=Commands(
                ['modifyvm', '{{ .Name }}', '--memory', '{{ user `memory` }}'],
                ['modifyvm', '{{ .Name }}', '--cpus', '{{ user `cpus` }}'],
            ),
            virtualbox_version_file='.vbox_version',
            post_shutdown_delay='{{ user `virtualbox_post_shutdown_delay` }}',
        ),
        common_builder.copy(
            type='hyperv-iso',
            disk_block_size=1,
            cpus='{{ user `cpus` }}',
            memory='{{ user `memory` }}',
            enable_secure_boot=False,
            generation=1,
            switch_name='{{ user `hyperv_switch` }}',
        ),
        common_builder.copy(
            type='parallel-iso',
            guest_os_type='{{ user `parallels_guest_os_type` }}',
            parallels_tools_flavor='lin',
            prlctl=Commands(
                ['set', '{{ .Name }}', '--memsize', '{{ user `memory` }}'],
                ['set', '{{ .Name }}', '--cpus', '{{ user `cpus` }}'],
            ),
            prlctl_version_file='.prlctl_version',
        )
    ],

    provisioners=[
        shell_provisioner.copy(
            scripts=[
                'script/sshd.sh',
                'script/hostname.sh',
                'script/graphical-target.sh',
                'script/vagrant.sh',
                'script/ostree-remote.sh',
                'script/crypto-policies.sh',
            ],
            environment_vars=base_env.copy(
                INSTALL_VAGRANT_KEY='{{ user `install_vagrant_key` }}',
                SSH_USERNAME='{{ user `ssh_username` }}',
                SSH_PASSWORD='{{ user `ssh_password` }}',
                OSTREE_REMOTE_NAME='{{ user `ostree_remote_name` }}',
                OSTREE_REMOTE='{{ user `ostree_remote` }}',
                OSTREE_REMOTE_CONTENTURL='{{ user `ostree_remote_contenturl` }}',
                OSTREE_GPG_KEY='{{ user `ostree_gpg_key` }}',
                CRYPTO_POLICY='{{ user `crypto_policy` }}',
                HOSTNAME='{{ user `vm_name` }}',
                BOX_VERSION='{{ user `os_version` }}-{{ user `box_version` }}',
            ),
        ),
        shell_provisioner.copy(
            scripts=['script/update.sh'],
            environment_vars=base_env.copy(UPDATE='{{ user `update`}}'),
            expect_disconnect=True,
        ),
        shell_provisioner.copy(
            scripts=['custom-script.sh', 'script/cleanup.sh'],
        ),
    ],

    post_processors=[
        PostProcessorChain(
            PostProcessor(
                type='vagrant',
                keep_input_artifact=False,
                vagrantfile_template='tpl/{{ user `vagrantfile_template` }}',
                output='box/{{.Provider}}/{{ user `vm_name` }}-{{ user `os_version` }}-{{ user `box_version` }}.box',
            ),
            Optional('upload' in sys.argv, PostProcessor(
                type='vagrant-cloud',
                access_token='{{ user `vagrant_cloud_token` }}',
                box_tag='{{ user `box_tag` }}',
                version='{{ user `os_version` }}-{{ user `box_version` }}',
                version_description='{{ user `version_description` }}',
            )),
        ),
    ],

    variables=Variables(
        cpus='2',
        memory='1024',
        disk_size='65536',

        ssh_password='vagrant',
        ssh_username='vagrant',
        install_vagrant_key='true',
        update='false',
        ostree_remote_name='',
        ostree_remote='',
        ostree_remote_contenturl='',
        ostree_gpg_key='',
        vagrantfile_template='vagrantfile.tpl',
        crypto_policy='',

        headless='',
        parallels_guest_os_type='fedora-core',
        virtualbox_guest_os_type='Fedora_64',
        vmware_guest_os_type='fedora-64',
        shutdown_command='echo vagrant | sudo -S shutdown -h now',
        virtualbox_post_shutdown_delay='10s',

        http_proxy='{{ env `http_proxy` }}',
        https_proxy='{{ env `https_proxy` }}',
        ftp_proxy='{{ env `ftp_proxy` }}',
        no_proxy='{{ env `no_proxy` }}',
        rsync_proxy='{{ env `rsync_proxy` }}',
    )
)


if __name__ == '__main__':
    e = JsonReprEncoder(indent=2)
    print(e.encode(atomic_workstation))
