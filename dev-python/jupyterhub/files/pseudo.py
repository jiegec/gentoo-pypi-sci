# Jupyterhub configuration
import os

eprefix = '/'

c.JupyterHub.cookie_secret_file = os.path.join(eprefix, '/var/lib/jupyterhub/cookie_secret')
c.JupyterHub.db_url = os.path.join(eprefix, '/var/lib/jupyterhub/jupyterhub.sqlite')
c.ConfigurableHTTPProxy.pid_file = os.path.join(eprefix, '/run/jupyterhub_proxy.pid')
c.JupyterHub.data_files_path = os.path.join(eprefix, '/usr/share/jupyterhub')

c.Spawner.notebook_dir = '~/'
c.Spawner.args = ['--config=' + os.path.join(eprefix, '/etc/jupyterhub/singleuser.py'), ]

c.JupyterHub.port = int(8000)
