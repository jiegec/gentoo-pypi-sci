# Jupyterhub configuration

c.JupyterHub.cookie_secret_file = '/var/lib/jupyterhub/cookie_secret'
c.JupyterHub.db_url = '/var/lib/jupyterhub/jupyterhub.sqlite'
c.ConfigurableHTTPProxy.pid_file = '/run/jupyterhub_proxy.pid'
c.JupyterHub.data_files_path = '/usr/share/jupyterhub'

c.Spawner.notebook_dir = '~/'
c.Spawner.args = ['--config=' + '/etc/jupyterhub/singleuser.py']

c.JupyterHub.port = int(8000)
