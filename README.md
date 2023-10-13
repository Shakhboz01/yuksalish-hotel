steps to run app:
1) run bundle
2) change db name from application.yml
3) rails db:create
4) run migration
5) git remote set-url origin <your origin new repo>
6) add app.yml to gitignore to do this:
   add `/config/application.yml` to .gitignore
   git rm -r --cached .
   git add .
   git commit -m ".gitignore is now working"
