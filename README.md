# Scripts-for-labs
Scripts created to get the computers in the department up and running _asap_.

## Rationale
Most computers in the labs have a hard time connecting to the web, due to the poor state of the lan cables. For that resons we choose to download the debian packages of the most commonly utilized software by professors in the department. For a list of the software go [here](DEPT-CCOM-UPRRP/software_list.yalm).

--------------------------------------------------
### Instructions for downloading a debian package
```bash
apt download <desired_package>
```

### Instructions for installing a debian package
```bash
apt install <desired_package>
```
**Needs root privilege**

### Instructions for running setup script
```bash
bash dept-setup.sh
```
**Needs root privilege**
