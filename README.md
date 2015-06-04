Installation
============


```
sudo -s
curl -L https://www.opscode.com/chef/install.sh | bash && apt-get install git -y && git clone https://github.com/serialdoom/aws_cookbook.git && cd aws_cookbook* && chef-solo -c solo.rb -j web.json
```
