#!/usr/bin/env python
#
# http://stevelosh.com/blog/2012/10/the-homely-mutt/#configuring-offlineimap
#

import os
import re
import yaml
import subprocess

imap_passwd_file = os.environ['HOME'] + '/.offlineimap-credentials'

def get_keychain_pass(account=None, server=None):
    """
        Gets the password for a given account from Apple's keychain
    """
    params = {
        'user': os.environ['USER'],
        'security': '/usr/bin/security',
        'command': 'find-internet-password',
        'account': account,
        'server': server,
        'keychain': os.environ['HOME'] + '/Library/Keychains/login.keychain'
    }

    command = "sudo -u %(user)s %(security)s -v %(command)s -g -a %(account)s -s %(server)s %(keychain)s" % params
    output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT)
    outtext = [line for line in output.splitlines() if line.startswith('password: ')][0]
    return re.match(r'password: "(.*)"', outtext).group(1)


def read_password_from_file(account=None):
    """
        Read credentials from a given password file

        Can be used on any system that does not have Keychain
    """
    stream = open(os.environ['HOME'] + '/.offlineimap.yaml', 'r')
    credentials = yaml.load(stream)
    return credentials[account]


def get_password_for(account=None, server=None):
    """
        Gets the password from either keychain (if we are on a Mac)
        or from a password file (if we are on Linux)
    """
    password = None
    if os.uname()[0] is 'Linux':
        password = get_keychain_pass(account=account, server=server)
    else:
        password = read_password_from_file(account=account)
    return password

