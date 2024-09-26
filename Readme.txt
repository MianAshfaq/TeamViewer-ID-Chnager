README - TeamViewer Process Automation Script

Overview
This batch script is designed to automate tasks related to managing TeamViewer processes, registry keys, and launching a portable version of TeamViewer. Additionally, it automatically opens a website and a Facebook profile after completing its tasks.

Features
Kill TeamViewer Processes: The script terminates all running instances of TeamViewer and related processes.
Backup and Restore Registry Keys: The script exports the relevant registry keys related to TeamViewer and Apple Bonjour, and restores them after running the AlterID.exe utility.
Run TeamViewer Portable: After completing the necessary operations, it starts the portable version of TeamViewer.
Open Website and Facebook Profile: Automatically opens the following URLs in the default web browser:
Official website: pasrur.pk
Facebook profile: Mian Ashfaq's Facebook
Script Breakdown
Terminate TeamViewer Processes:
The script uses taskkill to stop all processes related to TeamViewer (tv*, teamviewer.exe, and teamviewer_service.exe).

Backup Registry Keys:
The following registry keys are exported to .reg files:

HKCU\Software\TeamViewer
HKLM\SOFTWARE\WOW6432Node\TeamViewer
HKLM\SOFTWARE\WOW6432Node\Apple Inc.
Alter TeamViewer ID:
The script executes AlterID.exe with the -s parameter to modify the TeamViewer ID.

Restore Registry Keys:
The registry keys are imported back if the backup files exist. If not, the keys are deleted.

How to Use
Download and extract the contents of the folder.
Ensure that AlterID.exe, TeamViewerPortable.exe, and the batch script are in the same directory.
Run the batch file (.bat) by double-clicking it.
Once the script completes, 

Notes

Ensure that you have the necessary permissions to modify the registry and terminate processes.

If the registry keys do not exist, the script will delete them from the system.
This script is intended to work on systems with TeamViewer installed under the specified registry paths.

Disclaimer
Use this script at your own risk. Modifying the registry and terminating processes can have unintended side effects if used improperly.