ARG TERRAFORM_VERSION=1.5.6
FROM hashicorp/terraform:${TERRAFORM_VERSION}

LABEL com.github.actions.name="Terraform PR Commenter" \
      com.github.actions.description="Adds comments to a PR from Terraform fmt/init/plan/tflint output." \
      com.github.actions.icon="git-pull-request" \
      com.github.actions.color="blue"

RUN apk add --no-cache -q bash curl perl jq

ADD entrypoint.sh /entrypoint.sh
ADD /handlers /handlers
ADD /utilities /utilities
RUN chmod +x /entrypoint.sh \
    && chmod +x /handlers \
    && chmod +x /utilities

ENTRYPOINT ["/entrypoint.sh"]
