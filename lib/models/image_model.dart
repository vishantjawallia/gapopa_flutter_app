class ImageModel {
final int? total;
final int? totalHits;
final List<Hits>? hits;
const ImageModel({this.total , this.totalHits , this.hits });
ImageModel copyWith({int? total, int? totalHits, List<Hits>? hits}){
return ImageModel(
            total:total ?? this.total,
totalHits:totalHits ?? this.totalHits,
hits:hits ?? this.hits
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'total': total,
'totalHits': totalHits,
'hits': hits?.map<Map<String,dynamic>>((data)=> data.toJson()).toList()
    };
}

static ImageModel fromJson(Map<String , Object?> json){
    return ImageModel(
            total:json['total'] == null ? null : json['total'] as int,
totalHits:json['totalHits'] == null ? null : json['totalHits'] as int,
hits:json['hits'] == null ? null : (json['hits'] as List).map<Hits>((data)=> Hits.fromJson(data  as Map<String,Object?>)).toList()
    );
}

@override
String toString(){
    return '''ImageModel(
                total:$total,
totalHits:$totalHits,
hits:${hits.toString()}
    ) ''';
}

@override
bool operator ==(Object other){
    return other is ImageModel && 
        other.runtimeType == runtimeType &&
        other.total == total && 
other.totalHits == totalHits && 
other.hits == hits;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                total, 
totalHits, 
hits
    );
}
    
}
      
      
class Hits {
final int? id;
final String? pageURL;
final String? type;
final String? tags;
final String? previewURL;
final int? previewWidth;
final int? previewHeight;
final String? webformatURL;
final int? webformatWidth;
final int? webformatHeight;
final String? largeImageURL;
final int? imageWidth;
final int? imageHeight;
final int? imageSize;
final int? views;
final int? downloads;
final int? collections;
final int? likes;
final int? comments;
final int? userId;
final String? user;
final String? userImageURL;
const Hits({this.id , this.pageURL , this.type , this.tags , this.previewURL , this.previewWidth , this.previewHeight , this.webformatURL , this.webformatWidth , this.webformatHeight , this.largeImageURL , this.imageWidth , this.imageHeight , this.imageSize , this.views , this.downloads , this.collections , this.likes , this.comments , this.userId , this.user , this.userImageURL });
Hits copyWith({int? id, String? pageURL, String? type, String? tags, String? previewURL, int? previewWidth, int? previewHeight, String? webformatURL, int? webformatWidth, int? webformatHeight, String? largeImageURL, int? imageWidth, int? imageHeight, int? imageSize, int? views, int? downloads, int? collections, int? likes, int? comments, int? userId, String? user, String? userImageURL}){
return Hits(
            id:id ?? this.id,
pageURL:pageURL ?? this.pageURL,
type:type ?? this.type,
tags:tags ?? this.tags,
previewURL:previewURL ?? this.previewURL,
previewWidth:previewWidth ?? this.previewWidth,
previewHeight:previewHeight ?? this.previewHeight,
webformatURL:webformatURL ?? this.webformatURL,
webformatWidth:webformatWidth ?? this.webformatWidth,
webformatHeight:webformatHeight ?? this.webformatHeight,
largeImageURL:largeImageURL ?? this.largeImageURL,
imageWidth:imageWidth ?? this.imageWidth,
imageHeight:imageHeight ?? this.imageHeight,
imageSize:imageSize ?? this.imageSize,
views:views ?? this.views,
downloads:downloads ?? this.downloads,
collections:collections ?? this.collections,
likes:likes ?? this.likes,
comments:comments ?? this.comments,
userId:userId ?? this.userId,
user:user ?? this.user,
userImageURL:userImageURL ?? this.userImageURL
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'id': id,
'pageURL': pageURL,
'type': type,
'tags': tags,
'previewURL': previewURL,
'previewWidth': previewWidth,
'previewHeight': previewHeight,
'webformatURL': webformatURL,
'webformatWidth': webformatWidth,
'webformatHeight': webformatHeight,
'largeImageURL': largeImageURL,
'imageWidth': imageWidth,
'imageHeight': imageHeight,
'imageSize': imageSize,
'views': views,
'downloads': downloads,
'collections': collections,
'likes': likes,
'comments': comments,
'user_id': userId,
'user': user,
'userImageURL': userImageURL
    };
}

static Hits fromJson(Map<String , Object?> json){
    return Hits(
            id:json['id'] == null ? null : json['id'] as int,
pageURL:json['pageURL'] == null ? null : json['pageURL'] as String,
type:json['type'] == null ? null : json['type'] as String,
tags:json['tags'] == null ? null : json['tags'] as String,
previewURL:json['previewURL'] == null ? null : json['previewURL'] as String,
previewWidth:json['previewWidth'] == null ? null : json['previewWidth'] as int,
previewHeight:json['previewHeight'] == null ? null : json['previewHeight'] as int,
webformatURL:json['webformatURL'] == null ? null : json['webformatURL'] as String,
webformatWidth:json['webformatWidth'] == null ? null : json['webformatWidth'] as int,
webformatHeight:json['webformatHeight'] == null ? null : json['webformatHeight'] as int,
largeImageURL:json['largeImageURL'] == null ? null : json['largeImageURL'] as String,
imageWidth:json['imageWidth'] == null ? null : json['imageWidth'] as int,
imageHeight:json['imageHeight'] == null ? null : json['imageHeight'] as int,
imageSize:json['imageSize'] == null ? null : json['imageSize'] as int,
views:json['views'] == null ? null : json['views'] as int,
downloads:json['downloads'] == null ? null : json['downloads'] as int,
collections:json['collections'] == null ? null : json['collections'] as int,
likes:json['likes'] == null ? null : json['likes'] as int,
comments:json['comments'] == null ? null : json['comments'] as int,
userId:json['user_id'] == null ? null : json['user_id'] as int,
user:json['user'] == null ? null : json['user'] as String,
userImageURL:json['userImageURL'] == null ? null : json['userImageURL'] as String
    );
}

@override
String toString(){
    return '''Hits(
                id:$id,
pageURL:$pageURL,
type:$type,
tags:$tags,
previewURL:$previewURL,
previewWidth:$previewWidth,
previewHeight:$previewHeight,
webformatURL:$webformatURL,
webformatWidth:$webformatWidth,
webformatHeight:$webformatHeight,
largeImageURL:$largeImageURL,
imageWidth:$imageWidth,
imageHeight:$imageHeight,
imageSize:$imageSize,
views:$views,
downloads:$downloads,
collections:$collections,
likes:$likes,
comments:$comments,
userId:$userId,
user:$user,
userImageURL:$userImageURL
    ) ''';
}

@override
bool operator ==(Object other){
    return other is Hits && 
        other.runtimeType == runtimeType &&
        other.id == id && 
other.pageURL == pageURL && 
other.type == type && 
other.tags == tags && 
other.previewURL == previewURL && 
other.previewWidth == previewWidth && 
other.previewHeight == previewHeight && 
other.webformatURL == webformatURL && 
other.webformatWidth == webformatWidth && 
other.webformatHeight == webformatHeight && 
other.largeImageURL == largeImageURL && 
other.imageWidth == imageWidth && 
other.imageHeight == imageHeight && 
other.imageSize == imageSize && 
other.views == views && 
other.downloads == downloads && 
other.collections == collections && 
other.likes == likes && 
other.comments == comments && 
other.userId == userId && 
other.user == user && 
other.userImageURL == userImageURL;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                id, 
pageURL, 
type, 
tags, 
previewURL, 
previewWidth, 
previewHeight, 
webformatURL, 
webformatWidth, 
webformatHeight, 
largeImageURL, 
imageWidth, 
imageHeight, 
imageSize, 
views, 
downloads, 
collections, 
likes, 
comments
    );
}
    
}
      
      
  
     