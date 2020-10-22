# Alpine AWS CLI v2

This docker image packs AWS CLI v2 in alpine linux. The image us based on Alpine docker image version [].

The AWS CLI v2 version used is `2.0.30`

## Docker Builds and Tags

Please note the `latest` is the bleeding edge tag, and is not integration tested for stable releases use one ofthe published tags other than `latest`.

## Running the image

Pull the image

```bash
docker image pull anadimisra/alpine-awscli2:1.0
```

To run the image

```bash
docker run -v ~/.aws:/root/.aws --rm -it anadimisra/alpine-awscli2:1.0 [command]
```

Where `~/.aws` is the directory containing the aws configuration and credentials. For more details on them see [this link](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html).
