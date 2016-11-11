package com.safecard.web.client;

import com.safecard.web.vo.Profile;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.Arrays;
import java.util.List;

/**
 * Created by ramma on 0008,11/8/2016.
 */
@Component
public class RestClient {

    public RestClient(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    RestTemplate restTemplate = null; //new RestTemplate();

    String url = "http://localhost:8080/ProfileService/profile/";

    public RestClient() {
    }

    public List<Profile> getProfiles(){
        restTemplate = new RestTemplate();
        ResponseEntity<Profile[]> responseEntity = restTemplate.getForEntity(url, Profile[].class);
        System.out.println(" Profiles >>> "+ responseEntity.getBody());
        Profile[] profiles = responseEntity.getBody();
        return Arrays.asList(profiles);
    }


    public static void main(String[] args){
        RestTemplate restTemplate = new RestTemplate();
        String url = "http://localhost:8080/ProfileService/profile/";
        //Profile profileVo =
        System.out.println(" Profile VO >>> "+restTemplate.getForEntity(url, Profile[].class));
        ResponseEntity<Profile[]> responseEntity = restTemplate.getForEntity(url, Profile[].class);
        System.out.println(" Profiles >>> "+ responseEntity.getBody());
        Profile[] profile = responseEntity.getBody();
        System.out.println(" Proifle "+profile[0].getEmail());
    }
}
