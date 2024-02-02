#!/usr/bin/env python3

import os
import uuid
from argparse import ArgumentParser
from pathlib import Path

try:
    import requests
except ImportError:
    # Any version of requests will do
    from pip._vendor import requests

print('Using `requests` from:')
print(requests.__file__)

parser = ArgumentParser()
parser.add_argument('--role-arn')
parser.add_argument('--region', default='eu-west-2')

github_env = Path(os.environ['GITHUB_ENV'])


def main():
    args = parser.parse_args()

    token_url = os.environ['ACTIONS_ID_TOKEN_REQUEST_URL']
    token_request_token = os.environ['ACTIONS_ID_TOKEN_REQUEST_TOKEN']
    token_response = requests.get(token_url, headers={
        'Authorization': f'bearer {token_request_token}',
    })

    token = token_response.json()['value']
    path = write_tempfile(token)

    append_env('AWS_ROLE_ARN', args.role_arn)
    append_env('AWS_WEB_IDENTITY_TOKEN_FILE', path)
    append_env('AWS_DEFAULT_REGION', args.region)


def write_tempfile(content: str) -> Path:
    temp = Path('/tmp/') / uuid.uuid4().hex
    path = temp / 'webidentity.json'

    temp.mkdir()
    with path.open('w') as f:
        f.write(content)

    return path


# https://docs.github.com/en/actions/learn-github-actions/environment-variables#passing-values-between-steps-and-jobs-in-a-workflow
def append_env(key, value):
    line = f'{key}={value}\n'
    with github_env.open('a') as f:
        f.write(line)


if __name__ == '__main__':
    main()
