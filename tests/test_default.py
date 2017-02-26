import testinfra.utils.ansible_runner

'''
import pydevd
pydevd.settrace('192.168.99.1', port=51234,
                stdoutToServer=True, stderrToServer=True)
'''

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    '.molecule/ansible_inventory').get_hosts('all')


def test_pip_is_installed(PipPackage):
    assert_pip_package_is_installed(PipPackage, 'pip')


def test_lxml_is_installed(PipPackage):
    assert_pip_package_is_installed(PipPackage, 'lxml')


def test_requests_is_installed(PipPackage):
    assert_pip_package_is_installed(PipPackage, 'requests')


def assert_pip_package_is_installed(PipPackage, package_name):
    packages = PipPackage.get_packages()
    package = packages[package_name]
    assert package is not None
