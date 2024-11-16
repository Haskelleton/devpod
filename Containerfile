FROM alpine:edge

LABEL maintainer="Haskelleton"
LABEL description="devpod"
LABEL version="0.1"

ENV LANG=en_US.UTF-8
ENV PATH="/usr/local/bin:$PATH"
ENV TERM=xterm-256color

RUN apk add --update --no-cache \
    build-base cmake alpine-sdk \
    man-pages docs tzdata \
    bash bash-completion \
    doas \
    curl httpie \
    git git-bash-completion lazygit \
    tmux \
    neovim \
    fd fd-bash-completion \
    ripgrep ripgrep-bash-completion \
    python3 py3-pip py3-pip-bash-completion \
    rustup rustup-bash-completion \
    lua \
    nodejs npm \
    go \
    bottom \
    && rm -rf /var/cache/apk/*

RUN echo "permit nopass :wheel" > /etc/doas.d/doas.conf

ARG USERNAME=hask
ARG USER_UID=1000
ARG USER_GID=1000

RUN addgroup -g $USER_GID $USERNAME \
    && adduser -D -u $USER_UID -G $USERNAME -s /bin/bash $USERNAME \
    && adduser $USERNAME wheel \
    && mkdir -p /home/$USERNAME/dev \
    && mkdir -p /home/$USERNAME/bin \
    && mkdir -p /home/$USERNAME/.config/nvim \
    && mkdir -p /home/$USERNAME/.config/git \
    && chown -R $USERNAME:$USERNAME /home/$USERNAME

USER $USERNAME
ENV HOME=/home/$USERNAME
ENV PATH="$HOME/.cargo/bin:$HOME/bin:$PATH"
# ENV CARGO_HOME="$HOME/.cargo"
# ENV RUSTUP_HOME="$HOME/.rustup"
WORKDIR $HOME

RUN rustup-init -yq
RUN cargo install --git https://github.com/astral-sh/uv uv

RUN git clone --depth 1 https://github.com/AstroNvim/template $HOME/.config/nvim

# VOLUME [ "/home/${USERNAME}/dev" ]

# HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
#     CMD pgrep bash || exit 1

CMD ["bash"]
