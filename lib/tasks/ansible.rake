namespace :ansible do
  desc 'Using Ansible'

  task :deploy do
    desc 'Deploy using Ansible'
    hosts = "#{Rails.root}/playbook/hosts"
    playbook = "#{Rails.root}/playbook/deploy.yml"
    system "ansible-playbook -i #{hosts} #{playbook}"
  end
end
