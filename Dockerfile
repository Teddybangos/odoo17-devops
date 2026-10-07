FROM odoo:17

USER root

RUN mkdir -p /mnt/extra-addons

RUN chown -R odoo:odoo /mnt/extra-addons

USER odoo
