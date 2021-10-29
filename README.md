# Give me your code: I give you back your OCI image

## Quickstart

### Requirements

- [`kubectl`](https://kubernetes.io/docs/tasks/tools/#kubectl)
- [`kind`](https://kind.sigs.k8s.io/docs/user/quick-start/#installation)
- [`kapp`](https://github.com/vmware-tanzu/carvel-kapp)

### Let's start

```sh
make build
```

### The input

- [`app.go`](./app.go)
- [`Dockerfile`](./Dockerfile)

### The output

The OCI image published to in-cluster registry, exposed at `registry.default.svc.cluster.local:5000`:
- `registry.default:5000/sample:demo`

---

### More

#### Render templates with `ytt`

```sh
make template
```

#### Pass templates to `kbld` (to rename)

```sh
make kbld
```
