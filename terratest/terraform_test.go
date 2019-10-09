package test

import (
	"fmt"
	"github.com/gruntwork-io/terratest/modules/random"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// An example of how to test the simple Terraform module in examples/terraform-basic-example using Terratest.
func TestTerraformBasicExample(t *testing.T) {
	t.Parallel()
	uniqueNum := random.Random(100000, 999999)
	uniqueName := fmt.Sprintf("tftestacc%d", uniqueNum)
	apiGroupName := fmt.Sprintf("tftestacc%d", uniqueNum)
	apiGroupDescription := "created by terraform"
	apiName := uniqueName
	apiDescription := "created by terraform"
	apiAuthType := "APP"
	apiHttpServiceConfig := []map[string]string{{
		"address":   "http://apigateway-backend.alicloudapi.com:8080",
		"method":    "GET",
		"path":      "/web/cloudapi",
		"timeout":   "12",
		"aone_name": "cloudapi-openapi",
	}}
	apiRequestConfig := []map[string]string{{
		"protocol": "HTTP",
		"method":   "GET",
		"path":     "/test/path1",
		"mode":     "MAPPING",
	}}
	apiServiceType := "HTTP"
	apiRequestParameters := []map[string]string{{
		"name":         "test",
		"type":         "STRING",
		"required":     "REQUIRED",
		"in":           "QUERY",
		"in_service":   "QUERY",
		"name_service": "testparams",
	}}
	apiStageName := []string{
		"PRE",
		"RELEASE",
		"TEST",
	}

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"api_group_name":          apiGroupName,
			"api_group_description":   apiGroupDescription,
			"api_name":                apiName,
			"api_description":         apiDescription,
			"api_auth_type":           apiAuthType,
			"api_http_service_config": apiHttpServiceConfig,
			"api_request_config":      apiRequestConfig,
			"api_service_type":        apiServiceType,
			"api_request_parameters":  apiRequestParameters,
			"api_stage_name":          apiStageName,
			// We also can see how lists and maps translate between terratest and terraform.
		},

		// Disable colors in Terraform commands so its easier to parse stdout/stderr
		NoColor: true,
	}
	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	actualApiGroupName := terraform.Output(t, terraformOptions, "this_api_group_name")
	actualApiGroupDescription := terraform.Output(t, terraformOptions, "this_api_group_description")
	actualApiName := terraform.Output(t, terraformOptions, "this_api_name")
	actualApiDescription := terraform.Output(t, terraformOptions, "this_api_description")
	actualApiAuthType := terraform.Output(t, terraformOptions, "this_api_auth_type")
	actualApiRequestConfig := terraform.OutputList(t, terraformOptions, "this_api_request_config")
	actualApiServiceType := terraform.Output(t, terraformOptions, "this_api_service_type")
	actualApiHttpServiceConfig := terraform.OutputList(t, terraformOptions, "this_api_http_service_config")
	actualApiRequestParameters := terraform.OutputList(t, terraformOptions, "this_api_request_parameters")
	actualApiStageName := terraform.OutputList(t, terraformOptions, "this_api_stage_name")

	// Verify we're getting back the outputs we expect
	assert.Equal(t, apiGroupName, actualApiGroupName)
	assert.Equal(t, apiGroupDescription, actualApiGroupDescription)
	assert.Equal(t, apiName, actualApiName)
	assert.Equal(t, apiDescription, actualApiDescription)
	assert.Equal(t, apiAuthType, actualApiAuthType)
	assert.Equal(t, apiRequestConfig, StringSli2MapSli(actualApiRequestConfig))
	assert.Equal(t, apiServiceType, actualApiServiceType)
	assert.Equal(t, apiHttpServiceConfig, StringSli2MapSli(actualApiHttpServiceConfig))
	assert.Equal(t, apiRequestParameters, StringSli2MapSli(actualApiRequestParameters))
	assert.Equal(t, apiStageName, actualApiStageName)

}

func StringSli2MapSli(strSli []string) (mSli []map[string]string) {
	for _, s := range strSli {
		fmt.Println(s)
		mmSli := make(map[string]string)
		// this string format like `map[key1:value1 key2:value2]`
		s = s[4 : len(s)-1]
		sSli := strings.Fields(s)

		for _, ss := range sSli {
			n := strings.Index(ss, ":")
			if len(ss) != n+1 {
				mmSli[ss[:n]] = ss[n+1:]
			}
		}
		mSli = append(mSli, mmSli)
	}
	return
}
