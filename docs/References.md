# References

This file collects links to the most important/influential sources related to Open Cloud. "Open Cloud" is a semantically overloaded term. Google search brings up all kind of sites with this title.

## Open Specifications

1. [Google Open Cloud](https://cloud.google.com/open-cloud) - Google's interpretation of Open Cloud. All Kubernetes, of course.
2. [Open Cloud Services](https://www.onecommons.org/open-cloud-service-definition) - One Commons declaration of intent similar to OCIX's.
3. [Cloud Native Computing Foundation](https://www.cncf.io/) - a lot of Kubernetes-oriented projects
4. [POSIX](https://en.wikipedia.org/wiki/POSIX) - Wikipedia article with a high-level overview of the **Portable Operating System Interface** specification. The **Open Cloud Interface Specification** (OCIX) obviously portrayed the general idea of treating the cloud as hardware from here. The most recent specification (Issue 8) was released on June 18th. Download or access requires a registration (unclear if it is available for individuals or only for organizations). The previous Issue 7 is available [here](https://pubs.opengroup.org/onlinepubs/9699919799/). We could portray some ideas about the structure and conventions from here.
5. [Cloud Events](https://cloudevents.io/) - a CNCF project aiming at defining a standard schema of cloud events. Could be related eventually to putting the specs in sync, but also for the near term as a source of ideas of how such a spec could be structured.
6. [Open Telemetry](https://opentelemetry.io/) - an open standard for metrics, logs, and traces. Also, the CNCF project. As with POSIX and Cloud Events, we may consider using some ideas of the spec structure, terminology, etc.
7. [Open Container Initiative](https://opencontainers.org/) - a [Linux Foundation](https://www.linuxfoundation.org/projects) project; all major cloud vendors are here.

## Cloud Resources Specifications
Could be a useful source for preflight specifications.

1. [AWS CDK](https://docs.aws.amazon.com/cdk/v2/guide/home.html) - Wing preflight is a cloud-neutral version of CDK.
2. [Terraform CDK](https://developer.hashicorp.com/terraform/cdktf) - the Terraform's interpretation of CDK ideas. Resource specifications are still cloud-vendor specific (e.g. S3Bucket).
3. [Pulumi](https://www.pulumi.com/) - like with Terraform, cloud resource specification is vendor-dependent.
4. [Ampt.dev](https://www.getampt.com/) - cloud resources are specified in a cloud vendor-neutral form (e.g. storage)
5. [Go Cloud](https://pkg.go.dev/github.com/google/go-cloud) - an interesting implementation of the Google Open Cloud in Golang. Resource specifications seem to be cloud-neutral. The project seems to be abandoned, as it very often happens with Google. Some ideas for structuring the documentation might be useful.

There are probably more. TBD.
