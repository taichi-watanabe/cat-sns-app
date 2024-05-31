::: mermaid
erDiagram
users {
string id "ユーザ ID"
string name "ユーザ名"
String image_path "アイコン画像"
string email "メールアドレス"
string password "パスワード"
string password_confirmation "パスワード確認"
date make_date "アカウント作成日"
}

    pets {
        string id "ねこ識別id"
        string name "猫の名前"
        string kind "猫の種類"
        String sex "性別"
        int age "年齢"
        String catch_copy "キャッチコピー"
        String self_introduction "自己紹介"
    }

    follows {
        string id "followsID"
        string follower_id "フォロワーのユーザID"
        string followee_id "フォローされている側のユーザID"
    }

    comments {
        String id "コメント識別id"
        String comment "コメント"
        String article_id "コメントされた記事"
        String user_id "コメントしたユーザid"
    }

    likes {
        string id "いいね識別id"
        string user_id "いいねしたユーザid"
    　　 string article_id "いいねされた投稿id"
    }

    stores {
        string id "保存識別id"
        string user_id "保存したユーザid"
    　　 string article_id "保存された投稿id"
    }

    articles {
        string id "投稿id"
        string body "内容"
    　　 string image_path "画像"
        string user_id "ユーザid"
        string pets_id "ペットid"
        bool is_pet "ペットか野良猫か"
        date created_at "投稿作成日"
        date update_at "更新日"
    }

    messages {
        string id "メッセージ識別id"
        string message "内容"
        string user_id "ユーザid"
        date created_at "作成日"
        date update_at "更新日"
    }





    users ||--o{ follows : ""
    users ||--o{ comments : ""
    users ||--o{ pets : ""
    users ||--o{ articles : ""
    users ||--o{ likes : ""
    users ||--o{ stores : ""
    users ||--o{ messages : ""
    pets ||--o{ articles : ""
    articles ||--o{ comments : ""
    articles ||--o{ likes : ""
    articles ||--o{ stores : ""

:::
