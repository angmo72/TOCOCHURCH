package com.app.tococh.youtube.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.model.PlaylistItem;
import com.google.api.services.youtube.model.PlaylistItemListResponse;
import com.google.api.services.youtube.model.SearchListResponse;
import com.google.api.services.youtube.model.SearchResult;

@Service
public class YoutubeService {

    //@Value 어노테이션을 사용하여 application.yml에서 정의한 YouTube API 키를 주입 받음
    private String apiKey = "AIzaSyAkxcLxgfaOsbObv4v7WKEJYARZlvt2g2Y";
    private String chanelId = "UC-KakEog8Uc7h9iE8MJSAkQ";

    public String searchVideo(String query) throws IOException {
        // JSON 데이터를 처리하기 위한 JsonFactory 객체 생성
        JsonFactory jsonFactory = new JacksonFactory();

        // YouTube 객체를 빌드하여 API에 접근할 수 있는 YouTube 클라이언트 생성
        YouTube youtube = new YouTube.Builder(
                new com.google.api.client.http.javanet.NetHttpTransport(),
                jsonFactory,
                request -> {})
                .build();

        // YouTube Search API를 사용하여 동영상 검색을 위한 요청 객체 생성
        YouTube.Search.List search = youtube.search().list(Collections.singletonList("id,snippet"));

        // API 키 설정
        search.setKey(apiKey);

        // 검색어 설정
        search.setQ(query);

        // 검색 요청 실행 및 응답 받아오기
        SearchListResponse searchResponse = search.execute();

        // 검색 결과에서 동영상 목록 가져오기
        List<SearchResult> searchResultList = searchResponse.getItems();

        if (searchResultList != null && searchResultList.size() > 0) {
            //검색 결과 중 첫 번째 동영상 정보 가져오기
            SearchResult searchResult = searchResultList.get(0);

            // 동영상의 ID와 제목 가져오기
            String videoId = searchResult.getId().getVideoId();
            String videoTitle = searchResult.getSnippet().getTitle();

            return "Title: " + videoTitle + "\nURL: https://www.youtube.com/watch?v=" + videoId;
        }
        return "검색 결과가 없습니다";
    }
    
    public List<HashMap<String, Object>> playListVideo(String playList, int maxList) throws IOException {
        // JSON 데이터를 처리하기 위한 JsonFactory 객체 생성
        JsonFactory jsonFactory = new JacksonFactory();

        // YouTube 객체를 빌드하여 API에 접근할 수 있는 YouTube 클라이언트 생성
        YouTube youtube = new YouTube.Builder(
                new com.google.api.client.http.javanet.NetHttpTransport(),
                jsonFactory,
                request -> {})
                .build();

        // YouTube Search API를 사용하여 동영상 검색을 위한 요청 객체 생성
        YouTube.PlaylistItems.List listItem = youtube.playlistItems().list(Collections.singletonList("snippet"));

        // API 키 설정
        listItem.setKey(apiKey);

        // 검색어 설정
        listItem.setPlaylistId(playList);
        
        //list 최대숫자
        listItem.setMaxResults((long) maxList);

        // 검색 요청 실행 및 응답 받아오기
        PlaylistItemListResponse playListItemsResponse = listItem.execute();

        // 검색 결과에서 동영상 목록 가져오기
        List<PlaylistItem> playListItems = playListItemsResponse.getItems();

        List<HashMap<String, Object>> listMap = new ArrayList<HashMap<String, Object>>();
        
        if (playListItems != null && playListItems.size() > 0) {
        	for(PlaylistItem searchResult : playListItems) {
//            //검색 결과 중 첫 번째 동영상 정보 가져오기
//            PlaylistItem searchResult = playListItems.get(0);
        		HashMap<String, Object> pMap = new HashMap<String, Object>();
        		
	            // 동영상의 ID와 제목 가져오기
	            String videoTitle = searchResult.getSnippet().getTitle();
	            String videoDesc =  searchResult.getSnippet().getDescription();
	            String videoImg =  searchResult.getSnippet().getThumbnails().getDefault().getUrl();
	            String videoId = searchResult.getSnippet().getResourceId().getVideoId();
	            
	            pMap.put("title", videoTitle);
	            pMap.put("desc", videoDesc);
	            pMap.put("img", videoImg);
	            pMap.put("id", videoId);
	            
	            listMap.add(pMap);
	            
        	}

//            return "Title: " + videoTitle + "\nURL: https://www.youtube.com/watch?v=" + videoId;
        }
        return listMap;
    }
}