package com.autocloudpc.os;

import android.os.Bundle;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    private LinearLayout splashContainer;
    private View x11Container;
    private TextView statusText;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        splashContainer = findViewById(R.id.splash_container);
        x11Container = findViewById(R.id.x11_container);
        statusText = findViewById(R.id.status_text);

        // Simulación de carga del sistema
        startBootProcess();
    }

    private void startBootProcess() {
        new android.os.Handler().postDelayed(() -> {
            statusText.setText("Cargando entorno de escritorio...");
            
            new android.os.Handler().postDelayed(() -> {
                // Una vez que el servidor X11 está listo, cambiamos la vista
                showDesktop();
            }, 3000);
            
        }, 2000);
    }

    private void showDesktop() {
        splashContainer.setVisibility(View.GONE);
        x11Container.setVisibility(View.VISIBLE);
        // Aquí se conectaría la superficie de renderizado de Termux-X11
    }
}
