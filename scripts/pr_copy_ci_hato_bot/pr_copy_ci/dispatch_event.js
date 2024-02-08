module.exports = async ({ github, context }) => {
  const actionsCreateWorkflowDispatchParams = {
    owner: context.repo.owner,
    repo: 'sudden-death',
    workflow_id: 2452313,
    ref: 'use_github_app'
  }
  console.log('call actions.createWorkflowDispatch:')
  console.log(actionsCreateWorkflowDispatchParams)
  await github.rest.actions.createWorkflowDispatch({
    ...actionsCreateWorkflowDispatchParams
  })
}
