# --------------------------------------------------------
# Table structure for table `assignments`
# since 1.6.1

DROP TABLE `patches`;

CREATE TABLE `patches` (
	`patches_id` MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`atutor_patch_id` VARCHAR(20) NOT NULL default '',
	`applied_version` VARCHAR(10) NOT NULL default '',
	`patch_folder` VARCHAR(250) NOT NULL default '',
  `description` TEXT NOT NULL,
	`available_to` VARCHAR(250) NOT NULL default '',
  `sql_statement` text NOT NULL,
  `status` varchar(20) NOT NULL default '',
  `remove_permission_files` text NOT NULL,
  `backup_files` text NOT NULL,
  `patch_files` text NOT NULL,
	PRIMARY KEY  (`patches_id`)
);


# --------------------------------------------------------
# Table structure for table `assignments`
# since 1.6.1

DROP TABLE `patches_files`;

CREATE TABLE `patches_files` (
	`patches_files_id` MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`patches_id` MEDIUMINT UNSIGNED NOT NULL default 0,
	`action` VARCHAR(20) NOT NULL default '',
	`name` TEXT NOT NULL,
	`location` VARCHAR(250) NOT NULL default '',
	PRIMARY KEY  (`patches_files_id`)
);

# --------------------------------------------------------
# Table structure for table `assignments`
# since 1.6.1

DROP TABLE `patches_files_actions`;

CREATE TABLE `patches_files_actions` (
	`patches_files_actions_id` MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`patches_files_id` MEDIUMINT UNSIGNED NOT NULL default 0,
	`action` VARCHAR(20) NOT NULL default '',
	`code_from` TEXT NOT NULL,
	`code_to` TEXT NOT NULL,
	PRIMARY KEY  (`patches_files_actions_id`)
);

INSERT INTO `language_text` VALUES ('en', '_module','patcher','Patcher',NOW(),'');
INSERT INTO `language_text` VALUES ('en', '_template', 'get_my_patch', 'Get My Patch', now(), '');
INSERT INTO `language_text` VALUES ('en', '_template', 'atutor_patch_id', 'Atutor Patch ID', now(), '');
INSERT INTO `language_text` VALUES ('en', '_template', 'revert', 'Revert', now(), '');
INSERT INTO `language_text` VALUES ('en', '_template', 'available_to', 'Available To', now(), '');
INSERT INTO `language_text` VALUES ('en', '_msgs', 'AT_ERROR_PATCH_ALREADY_INSTALLED', 'The selected patch is already installed.', now(), 'error msg');
INSERT INTO `language_text` VALUES ('en', '_msgs', 'AT_ERROR_PATCH_XML_NOT_FOUND', 'Patch XML file is not found.', now(), 'error msg');
INSERT INTO `language_text` VALUES ('en', '_template', 'patcher_overwrite_modified_files', 
'The listed files are modified locally. If you choose to proceed, the patch file will be copied to your local machine. 
You have to manually merge this file and your local copy.<br>', now(), 'patcher');
INSERT INTO `language_text` VALUES ('en', '_template', 'patch_local_file_not_exist', 
'Cannot proceed. The listed files are not exist in your local machine. If you renamed them to your copy, in order to proceed, please rename back.<br>', now(), 'patcher');
INSERT INTO `language_text` VALUES ('en', '_template', 'patcher_alter_modified_files', 
'The listed files are modified locally. If you choose to proceed, your local file will be modified. The original
file will be backup before the modification. Please note that the modification on your customized code may break your customization.<br>', now(), 'patcher');
INSERT INTO `language_text` VALUES ('en', '_template', 'grant_write_permission', 
'Please grant <strong>write</strong> permission to listed folders and files:<p><strong>Note:</strong> To change permissions on Unix use <kbd>chmod a+rw</kbd> then the file name.</p>', now(), 'patcher');
INSERT INTO `language_text` VALUES ('en', '_template', 'remove_write_permission', 
'Please <strong>REMOVE</strong> write permission on the listed folders and files for your security:<p><strong>Note:</strong> To remove permissions on Unix use <kbd>chmod 755</kbd> then the file name..</p>', now(), 'patcher');
INSERT INTO `language_text` VALUES ('en', '_template', 'patcher_show_backup_files', 
'Below is the list of the backup files created by patch installation. After ensuring ATutor works properly with the patch, you may want to 
delete these files. If the ATutor does not work properly with the patch, you can always revert back to old ATutor by renaming the backup files 
to original files. <br>', now(), 'patcher');
INSERT INTO `language_text` VALUES ('en', '_template', 'patcher_show_patch_files', 
'Below is the list of the patch files copied to your computer. 
Please manually merge the change between the patch files and your local copy. <br>', now(), 'patcher');
INSERT INTO `language_text` VALUES ('en', '_template', 'patch_dependent_patch_not_installed', 
'<br><font color="red">Waring: Due to patch dependency, please install the listed patches first: </font><br>', now(), 'patcher');

