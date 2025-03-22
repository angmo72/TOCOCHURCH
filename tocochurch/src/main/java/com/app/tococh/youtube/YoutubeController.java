package com.app.tococh.youtube;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.app.tococh.youtube.service.YoutubeService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/youtube")
public class YoutubeController {


	private YoutubeService youtubeService;

	public YoutubeController(YoutubeService youtubeService) {
		this.youtubeService = youtubeService;
	}
	
	@GetMapping("/serachVideo.do")
    public ResponseEntity<String> searchVideo(@RequestParam Map<String, Object> paramMap) throws IOException {
        // YoutubeService를 통해 동영상 검색한 결과를 받아옴
		String query = (String) paramMap.get("query");
        String result = youtubeService.searchVideo(query);
        return ResponseEntity.ok(result);

    }
	
	@GetMapping("/playList.do")
    public HashMap<String, Object> playList(@RequestParam Map<String, Object> paramMap) throws IOException {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();

		// YoutubeService를 통해 동영상 검색한 결과를 받아옴
		String playList = (String) paramMap.get("playList");
        List<HashMap<String, Object>> resultList = youtubeService.playListVideo(playList);
        
		reMap.put("data", resultList);
		
		return reMap;

    }
	
}
