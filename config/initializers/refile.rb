# デフォルトではtmp/uploads/storeにアップロードされますが、今回の場合はpublic/uploads/に変更されています。
Refile.backends['store'] = Refile::Backend::FileSystem.new('public/uploads/')
