#include<bits/stdc++.h>

using namespace std;

int  matrix[100][100]; // �ڽӾ���
bool visited[100];     // �������
int  dist[100];        // Դ�㵽����i����̾���
int  path[100];        // ��¼���·��·��
int  source;           // Դ��
int  vertex_num;       // ������
int  edge_num;         // ����

void Dijkstra(int source)
{
    memset(visited, 0, sizeof(visited));  // ��ʼ���������
    visited[source] = true;
    for (int i = 0; i < vertex_num; i++)
    {
        dist[i] = matrix[source][i];
        path[i] = source;
    }

    int min_cost;        // Ȩֵ��С
    int min_cost_index;  // Ȩֵ��С���±�

    for (int i = 1; i < vertex_num; i++)  // �ҵ�Դ�㵽���� vertex_num-1 ��������·��
    {
        min_cost = INT_MAX;

        for (int j = 0; j < vertex_num; j++)
        {
            if (visited[j] == false && dist[j] < min_cost)  // �ҵ�Ȩֵ��С
            {
                min_cost = dist[j];
                min_cost_index = j;
            }
        }

        visited[min_cost_index] = true;  // �õ����ҵ������б��

        for (int j = 0; j < vertex_num; j++)  // ���� dist ����
        {
            if (visited[j] == false &&
                matrix[min_cost_index][j] != INT_MAX &&  // ȷ������֮���б�
                matrix[min_cost_index][j] + min_cost < dist[j])
            {
                dist[j] = matrix[min_cost_index][j] + min_cost;
                path[j] = min_cost_index;
            }
        }
    }
}

int main()
{
    cout << "������ͼ�Ķ�������<100����";
    cin >> vertex_num;
    cout << "������ͼ�ı�����";
    cin >> edge_num;

    for (int i = 0; i < vertex_num; i++)
        for (int j = 0; j < vertex_num; j++)
            matrix[i][j] = (i != j) ? INT_MAX : 0;  // ��ʼ�� matrix ����

    cout << "������ߵ���Ϣ��\n";
    int u, v, w;
    for (int i = 0; i < edge_num; i++)
    {
        cin >> u >> v >> w;
        matrix[u][v] = matrix[v][u] = w;
    }

    cout << "������Դ�㣨<" << vertex_num << "����";
    cin >> source;
    Dijkstra(source);

    for (int i = 0; i < vertex_num; i++)
    {
        if (i != source)
        {
            cout << source << " �� " << i << " ����̾����ǣ�" << dist[i] << "��·���ǣ�" << i;
            int t = path[i];
            while (t != source)
            {
                cout << "--" << t;
                t = path[t];
            }
            cout << "--" << source << endl;
        }
    }

    return 0;
}
