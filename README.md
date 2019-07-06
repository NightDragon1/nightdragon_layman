# NightDragon's Gentoo overlay
This is a layman repo for Gentoo Linux, maintaned by NightDragon.

## License
All files within this repo are released under the [GPLv2].

# Disclaimer
All information on this website or any repsoitory within - https://github.com/NightDragon1 - is published in good faith and for non commercial use only. This repository does not make any warranties about the completeness, reliability and accuracy of the content. Any action you take upon the content you find on this repository, is strictly at your own risk. The author will not be liable for any losses and/or damages in connection with the use of it.

## Consent
By using this repository or any content provided here, you hereby consent to my disclaimer and agree to its terms.

## Update
Should we update, amend or make any changes to this document, those changes will be prominently posted here.

# How to use the repository.
1. Install layman 
As it's a layman repository you first have to install layman on your gentoo system.

2. Run one of the following commands 
```bash
eselect repository add nightdragon_layman git https://github.com/NightDragon1/nightdragon_layman.git
```
or:
```bash
layman -o https://github.com/NightDragon1/nightdragon_layman/master/layman.xml -f -a nightdragon_layman
```

### Updating the local repo
```bash
layman -S
```
