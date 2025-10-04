# Use a base JupyterLab image
FROM jupyter/datascience-notebook:latest

# Switch to root user to install system-level packages
USER root

# Install any necessary system packages (e.g., git, vim)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    vim \
    g++ \
    gcc \
    npm \
    && rm -rf /var/lib/apt/lists/*

# RUN apt-get update && apt-get install -y nodejs npm && rm -rf /var/lib/apt/lists/*

# Switch back to the 'jovyan' user (the default user in Jupyter Docker images)
USER jovyan

# Install desired Python packages using pip
# Create a requirements.txt file in the same directory as the Dockerfile
# and list your Python packages there.
COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt


# RUN jupyter labextension install @plotly/dash-jupyterlab --no-build

RUN jupyter lab build

# RUN pip install --no-cache-dir -r /tmp/requirements.txt && \
#    rm /tmp/requirements.txt

# Install JupyterLab extensions
# Example: jupyterlab-plotly
# RUN jupyter labextension install jupyterlab-plotly@latest
# RUN jupyter labextension install nbdime-jupyterlab jupyterlab-dash jupyterlab-plotly
# install nbdime-jupyterlab jupyterlab-dash

# Copy custom configuration files if needed
# For example, a custom jupyter_notebook_config.py
# COPY jupyter_notebook_config.py /home/jovyan/.jupyter/

# Set the default command to start JupyterLab
CMD ["start.sh", "jupyter-lab"]
