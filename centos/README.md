

## rsync

    rsync -avxHP --exclude="SRPMS" --exclude="i386" --delete rsync://yum.puppetlabs.com/packages/yum/ /data/yum/puppetlabs/
