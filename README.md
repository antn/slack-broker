# slack-broker
A simple API for storing Slack API keys and inviting users to teams.

Slack doesn't have scoped tokens (an admin token must be used to invite people), so if I'm building something that allows for inviting users to a Slack team, I want to make sure things are as secure as possible. So, I created this broker app to store the tokens outside of my main application, and have the tokens encrypted so that a database breach will not compromise everyone's Slack teams.

## Getting Started

Generate and set your `secret_key_base` and `token_key` in `secrets.yml`.

**You should generate a VERY secure `token_key` to make sure that if your database is compromised it will be difficult to decrypt a user's API token!**

## Usage

### Register

Before inviting users, you have to register your API token with the broker. This token MUST belong to a team administrator.

    POST /token/register

#### Parameters
| Name          | Type       | Description                                               |
| ------------- | ---------- | --------------------------------------------------------- |
| `token`       | `string`   | Slack admin token for team that you are inviting users to |

#### Response

If all is well, you will receive a UUID in the response. Save this in your application, since you'll need it to invite users.

```
{
  "ok": true,
  "uuid": "64b80e2b-7c08-4a10-9649-b7dd96874c4c"
}
```

### Info

You can get information about the team your token is for by using that team's uuid.

    POST /team/info

#### Parameters
| Name          | Type       | Description                               |
| ------------- | ---------- | ----------------------------------------- |
| `uuid`        | `string`   | UUID from token that you registered

#### Response

If your uuid is valid, you will receive information about the team it is for.

```
{
  "ok": true,
  "team": {
    "id": "T12345",
    "name": "My Team",
    "domain": "example",
    "email_domain": "",
    "icon": {
      "image_34": "https:\/\/...",
      "image_44": "https:\/\/...",
      "image_68": "https:\/\/...",
      "image_88": "https:\/\/...",
      "image_102": "https:\/\/...",
      "image_132": "https:\/\/...",
      "image_default": true
    }
  }
}
```

### Invite

To invite users, you'll use your UUID you received when you registered your API token.

    POST /team/invite

#### Parameters
| Name          | Type       | Description                               |
| ------------- | ---------- | ----------------------------------------- |
| `uuid`        | `string`   | UUID from token that you registered       |
| `email`       | `string`   | email of user you want to invite to Slack |

#### Response

If your parameters are valid, you will receive a confirmation that you have invited the user.

```
{
  "ok": true,
  "message": "invite_sucessful"
}
```

### Deregister

If you no longer want your token stored, you can deregister it.

    POST /token/deregister

#### Parameters
| Name          | Type       | Description                               |
| ------------- | ---------- | ----------------------------------------- |
| `uuid`        | `string`   | UUID from token that you registered       |

#### Response

Your token should be removed from the database.

```
{
  "ok": true,
  "message": "token_destroyed"
}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
