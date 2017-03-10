import commands
import os
output = commands.getoutput('ps -A')

def print_line():
        print '-----------------------------'

def check_httpd():
        if 'httpd' in output:
                print_line()
                print 'Service HTTPD is running !'
                print_line()
        else:
                print_line()
                print 'Service HTTPD is not running, so starting it !'
                print_line()
                os.system('sudo systemctl start httpd')
                print 'Checking status after starting service...'
                os.system('sudo systemctl status httpd')

def check_sshd():
        if 'sshd' in output:
                print_line()
                print 'Service sshd is running !'
                print_line()
        else:
                print_line()
                print 'Service sshd is not running, so starting it !'
                print_line()
                os.system('sudo systemctl start sshd')
                print 'Checking status after starting service...'
                os.system('sudo systemctl status sshd')

def services():
        check_httpd()
        check_sshd()

def main():
        services()

if __name__=='__main__':
        main()
