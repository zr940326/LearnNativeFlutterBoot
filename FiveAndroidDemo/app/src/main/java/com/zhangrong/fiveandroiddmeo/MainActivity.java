package com.zhangrong.fiveandroiddmeo;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import java.lang.ref.WeakReference;

public class MainActivity extends AppCompatActivity {
    public static WeakReference<MainActivity> sRef;

    private Button bt_jpFlutterPage;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        sRef = new WeakReference<>(this);
        initViews();


    }

    private void initViews() {
        bt_jpFlutterPage = (Button) findViewById(R.id.bt_jpFlutterPage);
        bt_jpFlutterPage.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(MainActivity.this, FlutterPageActivity.class));
            }
        });

    }


    @Override
    protected void onDestroy() {
        super.onDestroy();
        sRef.clear();
        sRef = null;
    }


}


