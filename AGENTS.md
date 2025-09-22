# Agent Guidelines for Dotfiles Ansible Repository

## Build/Test Commands
- **Run Ansible playbook**: `ansible-playbook ./playbooks/setup.yml`
- **Install dependencies**: `ansible-galaxy role install --role-file ./requirements.yml --force`
- **Syntax check**: `ansible-playbook --syntax-check ./playbooks/setup.yml`
- **Dry run**: `ansible-playbook --check ./playbooks/setup.yml`
- **Single role test**: `ansible-playbook ./playbooks/setup.yml --tags "role_name"`

## Code Style Guidelines
- Use YAML (.yml) for all Ansible files, not .yaml
- Follow 2-space indentation for YAML files
- Use snake_case for variable names and file names
- Place sensitive data in ansible-vault encrypted variables
- Use `ansible.builtin.*` module names explicitly
- Use `become: true` for tasks requiring sudo privileges
- Template files should use `.j2` extension

## File Organization
- Roles go in `./roles/` directory
- Playbooks in `./playbooks/` directory
- Inventory files in `./inventories/`
- Configuration files copied to roles should be in `files/` subdirectory
- Templates in `templates/` subdirectory of roles

## Error Handling
- Always specify `state: present|absent` for package installations
- Use `when:` conditions for conditional tasks
- Use proper error handling with `ignore_errors: true` when appropriate