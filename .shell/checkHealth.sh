# sudo apt-get install jq
# export API_URL_SSM="`aws ssm get-parameter --name /poja-sarisary-std21076/$1/api/url`"
# export API_URL=`echo $API_URL_SSM | jq -r '.Parameter.Value'`
# curl --fail "$API_URL$2"

sudo apt-get install -y jq

echo "Récupération de l'URL depuis AWS SSM..."
export API_URL_SSM="`aws ssm get-parameter --name /poja-sarisary-std21076/$1/api/url`"
echo "URL brute récupérée depuis AWS SSM : $API_URL_SSM"

export API_URL=`echo $API_URL_SSM | jq -r '.Parameter.Value'`
echo "URL formatée : $API_URL"

echo "Exécution de la requête curl : $API_URL$2"
curl --fail "$API_URL$2"