# https://gist.github.com/FilBot3/4424d312a87f7b4178722d3b5eb20212

flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak --user install flathub com.visualstudio.code com.visualstudio.code.tool.podman
systemctl --user --now enable podman.socket
flatpak override --user --filesystem=xdg-run/podman com.visualstudio.code
flatpak run --command=bash com.visualstudio.code -c 'code --install-extension ms-vscode-remote.vscode-remote-extensionpack'


# issue with podman 3 https://github.com/flathub/com.visualstudio.code.tool.podman/issues/13
# cool build thing https://skaffold.dev/docs/pipeline-stages/builders/docker/

# https://blog.christophersmart.com/2021/01/31/podman-volumes-and-selinux/
