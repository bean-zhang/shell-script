
    sudo yum groupinstall "Development Tools"
    sudo yum install gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel
    sudo yum install curl-devel
    
    make configure
    ./configure --prefix=/usr/local
    
    sudo make install
    git --version

- [How To Install Git on CentOS 7](https://www.digitalocean.com/community/tutorials/how-to-install-git-on-centos-7)
- [Getting Started - Installing Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
