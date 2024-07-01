# Wing Documentation: Structure, Tools, and Process

General description and **Usage** (kind of User Guide) documentation of each Winglang class resides alonside its source. Specificaly, general description and **Usage** documentation of all `cloud` module classes can be found [here](https://github.com/winglang/wing/tree/main/libs/wingsdk/src/cloud).

Documentation files have the same name as the corresponding class `.ts` file. For example:

- `bucket.ts`: source file
- `bucket.md`: documentation

Each file contains:

- meta-data: name, id, description, keywords
- one or more paragraphs with general description
- **Usage** section describing most frequent usages
- **Target-specific details** section with additional information about implementation on each supported target platfrom

Reference documentation is automatically extracted from the source file. Each class, data structure and method has a commentary prefix following the [TSDoc](https://tsdoc.org/) convention.

This is done by the [docgen.mts](https://github.com/winglang/wing/blob/main/libs/wingsdk/scripts/docgen.mts) script, which in turn uses the [jsii-docgen](https://github.com/winglang/wing/tree/main/apps/jsii-docgen) library forked from the orginal [cdklabs library and tool](https://github.com/cdklabs/jsii-docgen/tree/main).

According to the [jsii repository](https://github.com/aws/jsii) 'jsii allows code in any language to naturally interact with JavaScript classes. It is the technology that enables the AWS Cloud Development Kit to deliver polyglot libraries from a single codebase!'.

Combined documentation is placed in the separate [doc](https://github.com/winglang/wing/tree/main/docs/docs/04-standard-library/cloud) folder.

The build process is orchestrated by the [Turbo](https://turbo.build/repo) tool, which eventually produces a docs.tgz file in the [releases](https://github.com/winglang/wing/releases) folder. TODO: still unclear how exactly this happens.

The final documentation site is produced by another [docsite](https://github.com/winglang/docsite) project. The [updateDocs](https://github.com/winglang/docsite/blob/main/scripts/updateDocs.ts) script  downloads the `docs.tgz` file from [releases](https://github.com/winglang/wing/releases) and upacks it into the [versioned_docs](https://github.com/winglang/docsite/tree/main/versioned_docs/version-latest) folder. The site is built using the [Docusaurus](https://docusaurus.io/) tool. The `docusaurus build` command does the job based on the [docusaurus.config.js](https://github.com/winglang/docsite/blob/main/docusaurus.config.js) configuration file. It uses the `docusaurus deploy` command to publish the site on [docs.winglang.io](https://docs.winglang.io/) hosted on AWS. Presumably, this is Wing project, but exact details are unclear.
