
import os
import shutil
import subprocess

if __name__ == "__main__":

	if 'EXIT_AT_START_PREP' in os.environ and os.environ['EXIT_AT_START_PREP'] == "TRUE":
		exit(0)
		
	if os.path.isdir(os.environ['BUILT_PRODUCTS_DIR']):
		createDirectoryCall = subprocess.Popen(['rm', '-rf', os.environ['BUILT_PRODUCTS_DIR']], stdout=subprocess.PIPE)
		createDirectoryData = createDirectoryCall.communicate()[0]
		createDirectoryCallReturnCode = createDirectoryCall.returncode
	
	folder = os.path.join(os.environ['TARGET_BUILD_DIR'], os.environ['WRAPPER_NAME'])

	if os.path.isdir(folder):
		removeDirectoryCall = subprocess.Popen(['rm', '-r', folder], stdout=subprocess.PIPE)
		removeDirectoryData = removeDirectoryCall.communicate()[0]
		removeDirectoryCallReturnCode = removeDirectoryCall.returncode
	
	createDirectoryCall = subprocess.Popen(['mkdir', '-p', folder], stdout=subprocess.PIPE)
	createDirectoryData = createDirectoryCall.communicate()[0]
	createDirectoryCallReturnCode = createDirectoryCall.returncode
		
	if os.path.isfile("/Applications/preflight.py"):
		execfile("/Applications/preflight.py")