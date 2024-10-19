import type { Context } from "@actions/github/lib/context";
import type { GitHub } from "@actions/github/lib/utils";
import { RestEndpointMethodTypes } from "@octokit/plugin-rest-endpoint-methods";
import { createPullRequestHatoBot } from "../../create_pull_request_hato_bot";

export async function script(
  github: InstanceType<typeof GitHub>,
  context: Context,
) {
  const commonParams = {
    owner: context.repo.owner,
    repo: context.repo.repo,
  };
  const pullsCreateParams: RestEndpointMethodTypes["pulls"]["create"]["parameters"] =
    {
      head: context.repo.owner + ":master",
      base: "develop",
      title: "master -> develop",
      body: "鳩の歴史は同期される\ndevelopに新たなコミットがpushされる前にマージしてね！",
      ...commonParams,
    };
  await createPullRequestHatoBot(github, pullsCreateParams, commonParams);
}
