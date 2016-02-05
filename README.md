# ghost-theme-development

A Vagrant virutal machine setup for easy Ghost theme development.

## Installation

- Fork the repository on GitHub.
- Clone your repository to your computer (host).
- If you want to change the default configurations for the virtual machine (you can review them in `vm_config.default.yml`), copy the `vm_config.defaul.yml` to `vm_config.yml` and alter the settings as required.
- On the command line, get access to the directory to which you cloned your repository.
- Run `vagrant up` to start the virtual machine.
- Once setup is complete (5 - 15 minutes), run `vagrant ssh` to access your virtual machine.
- Inside your virtual machine (guest), you can start Ghost by running `ghost`.
- Assuming you didn't alter the default virtual machine configuration, view http://192.168.45.54:2368/ in your browser.

That's it. Everything you need to have ghost up and running is there :)

## Theme development

If you'd like to develop your own theme, there is script to make that process a little easier. It will:

- Copy the Casper theme that comes with Ghost into the `theme` directory of your repository.
- It will rename `theme/package.json` to the name of the `GHOST_THEME_NAME`.
- It will symlink the theme directory into Ghost so that you can choose your theme within Ghost admin.

To get started:

- On your host, open `env.json` and customise the name of your new theme by changing `ghostly` to anything you like (one word, lowercase, no special characters).
- In your guest, run `new-theme` and the theme will be copied across and the name changed for you.
- If Ghost was already running, stop it and start it again.
- Head over to http://192.168.45.54:2368/ghost/settings/general/ and choose your new theme in the `Theme` select list.

You should commit the theme directory from here on in, so that you don't loose any work.
