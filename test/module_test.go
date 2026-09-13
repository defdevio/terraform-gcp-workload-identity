package test

import (
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	test_structure "github.com/gruntwork-io/terratest/modules/test-structure"
	"github.com/stretchr/testify/assert"
)

func TestModulePlan(t *testing.T) {
	terraformDir := test_structure.CopyTerraformFolderToTemp(t, "..", ".")

	options := &terraform.Options{
		TerraformBinary: "tofu",
		TerraformDir:    terraformDir,
		PlanFilePath:    filepath.Join(t.TempDir(), "terraform-module.tfplan"),
		Vars:            map[string]interface{}{"project_id": "opendepot-demo", "create_resources": false},
	}

	terraform.InitAndPlan(t, options)
	plan := terraform.ShowWithStruct(t, options)

	assert.Empty(t, plan.ResourceChangesMap)
	assert.Equal(t, "serviceAccount:opendepot-demo.svc.id.goog[opendepot/opendepot-server]", plan.RawPlan.OutputChanges["workload_identity_member"].After)
}
