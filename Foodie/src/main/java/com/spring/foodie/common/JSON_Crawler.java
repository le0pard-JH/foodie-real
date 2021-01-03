package com.spring.foodie.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;

import org.json.JSONException;
import org.json.JSONObject;

public class JSON_Crawler {

  private static String readAll(Reader rd) throws IOException {
    StringBuilder sb = new StringBuilder();
    int cp;
    while ((cp = rd.read()) != -1) {
      sb.append((char) cp);
    }
    return sb.toString();
  }

  public static JSONObject readJsonFromUrl(String url) throws IOException, JSONException {
    InputStream is = new URL(url).openStream();
    try {
      BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
      String jsonText = readAll(rd);
      JSONObject json = new JSONObject(jsonText);
      return json;
    } finally {
      is.close();
    }
  }

  public static void main(String args[]) throws IOException, JSONException {

    String Pre = "https://place.map.kakao.com/main/v/";
    String Sub = "25406298";

    String JSON_URL = Pre + Sub;

    JSONObject json = readJsonFromUrl(JSON_URL);
   //  System.out.println(json.toString());

    // Object json_org = json.get(json.toString());

    Object basicInfo = json.get("basicInfo");
    Object blogReview = json.get("blogReview");
    Object kakaoStory = json.get("kakaoStory");
    Object comment = json.get("comment");
    Object findway = json.get("findway");

    Object menuInfo = json.get("menuInfo");
    Object photo = json.get("photo");
     Object s2graph = json.get("s2graph");

    System.out.println(basicInfo);
    System.out.println(photo);

  }

}
