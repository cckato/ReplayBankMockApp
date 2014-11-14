server '54.65.87.57',port: 22, user: 'ec2-user', roles: %w{app web db}, ssh_options: {
    keys: %(~/.ssh/MyFirstEC2KeyPair.pem),
    auth_methods: %w(publickey)
}

